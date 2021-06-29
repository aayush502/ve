json.extract! student, :id, :name, :grade, :roll_no, :created_at, :updated_at
json.url student_url(student, format: :json)
