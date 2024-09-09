class Users::Create < ActiveInteraction::Base
  GENDERS = [
    'male',
    'female'
  ]

  hash :params do
    string :name, :surname, :patronymic, :email, :nationality, :country, :gender
    string :skills, default: nil
    integer :age
    array :interests, default: nil do
      string
    end
  end

  validate  :user_already_exists,
            :age_in_valid_range,
            :gender_is_correct

  def execute
    user_full_name = "#{params['surname']} #{params['name']} #{params['patronymic']}"
    user_params = params.except(:interests, :skills)
    user = User.new(user_params.merge(full_name: user_full_name))

    Interest.where(name: params['interests']).each do |interest|
      user.interests.push interest
    end

    Skill.where(name: params['skills']&.split(',')).each do |skill|
      user.skills.push skill
    end

    user.save!
    user
  end

  private

  def user_already_exists
    errors.add("params[:email]", 'already taken') if User.find_by(email: params['email'])
  end

  def age_in_valid_range
    errors.add("params[:age]", 'out of valid range') if params['age'] <= 0 || params['age'] > 90
  end

  def gender_is_correct
    errors.add("params[:gender]", 'invalid') if GENDERS.exclude?(params['gender'])
  end
end
