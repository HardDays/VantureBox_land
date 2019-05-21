class CompaniesController < ApplicationController
  before_action :authorize_user, only: [:create]
  swagger_controller :company, "Startup company"

  # POST /companies
  swagger_api :create do
    summary "Create company"
    param :path, :user_id, :integer, :required, "Startup user id"
    param :form, :name, :string, :required, "Company name"
    param :form, :website, :string, :required, "Company website"
    param :form, :description, :string, :optional, "Company description"
    param :form, :is_interested_in_access, :boolean, :optional, "We are you interested in"
    param :form, :is_interested_in_insights, :boolean, :optional, "We are you interested in"
    param :form, :is_interested_in_capital, :boolean, :optional, "We are you interested in"
    param :form, :is_interested_in_marketplace, :boolean, :optional, "We are you interested in"
    param_list :form, :markets, :string, :optional, "", [:financial_markets]
    param :form, :founded_in, :integer, :optional, "Founded in"
    param_list :form, :current_stage, :integer, :optional, "Company description"
    param :form, :evaluation, :string, :optional, "Company description"
    param :form, :is_revenue_consumer, :boolean, :optional, "Company description"
    param :form, :is_revenue_wholesale, :boolean, :optional, "Company description"
    param :form, :is_revenue_other, :boolean, :optional, "Company description"
    param :form, :investor_deck_link, :string, :optional, "Company description"
    param :form, :investor_deck_file, :string, :optional, "Company description"
    param :form, :current_revenue, :integer, :optional, "Company description"
    param :form, :current_stage_description, :string, :optional, "Company description"
    param :form, :primary_market, :string, :optional, "Company description"
    param :form, :target_market, :string, :optional, "Company description"
    param :form, :target_revenue, :integer, :optional, "Company description"
    param :header, 'Authorization', :string, :required, 'Authentication token'
    response :created
    response :unauthorized
    response :unprocessable_entity
  end
  def create
    Company.transaction do
      @company = Company.new(company_params)
      @company.user_id = @user.id

      if @company.save
        render json: @company, status: :created
      else
        render json: @company.errors, status: :unprocessable_entity
      end
    end
  rescue
    render json: {errors: :FAILED_SAVE_COMPANY}, status: :unprocessable_entity
  end

  private
    def authorize_user
      @user = AuthorizationHelper.authorize(request)

      if @user == nil
        render status: :unauthorized and return
      end

      if @user.id != params[:user_id].to_i
        render json: {errors: :WRONG_USER_ID}, status: :forbidden and return
      end
    end

    def set_company
      begin
        @company = Company.find(params[:id])
      rescue
        render status: :not_found
      end
    end

    def company_params
      params.permit(:name, :website, :description, :is_interested_in_access, :is_interested_in_insights,
                    :is_interested_in_capital, :is_interested_in_marketplace, :markets, :founded_in,
                    :current_stage, :evaluation, :is_revenue_consumer, :is_revenue_wholesale, :is_revenue_other,
                    :investor_deck_link, :investor_deck_file, :current_revenue, :current_stage_description,
                    :primary_market, :target_market, :target_revenue)
    end
end
