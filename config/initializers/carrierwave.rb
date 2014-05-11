if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.root = "#{Rails.root}/spec/support"
  end
end