class UserMailer < ApplicationMailer
  default from: "noreply@virtualeye.net"

  def sample_email()
    @user = CustomerInfo.order("updated_at DESC").first
    mail(to: @user.email, subject: "Thank you")
  end

  def author_email(files, images)
    files.each do |file|
      attachments[file["file_name"]] = {
        data: file["data"],
      }
    end

    images.each do |image|
      attachments[image["image_name"]] = {
        data: image["image_data"],
      }
    end
    @user_detail = CustomerInfo.order("updated_at DESC").first
    @user_issues = Questioniare.order("updated_at DESC").first
    mail(to: "aayushhumagain23@gmail.com", subject: "Patient Info")
  end
end
