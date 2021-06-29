class CustomersController < ApplicationController
  protect_from_forgery :only => [:save]
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:save]

  def save
    if create_customerinfo_questioniare(params)
        files = generate_file_list(params[:report])
        images = generate_image_list(params[:image])
        thread = Thread.new do
          UserMailer.sample_email().deliver
          UserMailer.author_email(files, images).deliver
          thread.kill
      end
      render json: { status: 200, message: "Successfully Submitted" }
    else
      render json: { status: 500, message: "Submitted Failed" }
    end
  end
  
  def mail_test
    @user_issues = Questioniare.order("updated_at DESC").first
  end

  def generate_image_list(images)
    new_images = []
    images.each do |image|
      images_hash = Hash.new
      images_hash["image_name"] = image.original_filename
      images_hash["image_data"] = File.read(image)
      new_images.push(images_hash)
    end
    new_images
  end

  def generate_file_list(files)
    files ||= []
    new_files = []
    files.each do |file|
      files_hash = Hash.new
      files_hash["file_name"] = file.original_filename
      files_hash["data"] = File.read(file)
      new_files.push(files_hash)
    end
    new_files
  end

  def delete
    byebug
    customer = CustomerInfo.find(params[:id])
    customer.destroy
    redirect_to customer_info_path
  end

  def info
    @customer = CustomerInfo.all
  end

  def signup
  end

  def sign_up_user
    unless User.where(email: params[:email]).exists?
        user = User.new
        user.email = params[:email]
        user.password = params[:pass]
        if params[:admin] || params[:editor] == "on"
          user.admin = params[:admin]
          user.editor = params[:editor]
        end
        user.save!
        redirect_to customer_info_path
      end
    end

  def create_customerinfo_questioniare(params)
    ActiveRecord::Base.transaction do
      customers = CustomerInfo.where(email: params[:email]).first_or_initialize()
      customers.date_of_birth = params[:DOB]
      customers.name = params[:name]
      customers.contact = params[:contact]
      customers.save!
      question = Questioniare.where(customer_id: customers.id).first_or_initialize()
      question.customer_id = customers.id
      question.eye = params[:eye]
      question.symptom = params[:symptoms]
      question.duration = params[:time]
      question.description = params[:nonListed]
      question.conference = params[:videoConsultation]
      question.save!

      return true
    rescue Exception => ex
      return ex
    end
  end

  def customer_detail
    question = ActiveRecord::Base.connection.execute("select name,email,customer_id,eye,duration,symptom,description from customer_infos ci left join questioniares q on q.customer_id = ci.id where ci.id=" + params["customer_detail"])[0]
    render json: question
  end

  def download
    @customer = CustomerInfo.find(params[:id])
    @question = Questioniare.where(customer_id: params[:id]).first
    pdf = WickedPdf.new.pdf_from_string(render_to_string("download.html.erb", layout: false))
    send_data(pdf,
              filename: "download.pdf",
              type: "application/pdf",
              disposition: "attachment")
  end
end
