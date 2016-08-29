class DocumentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def index
    @documents = Document.all
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_path
  end
end
