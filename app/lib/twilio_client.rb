class TwilioClient
  Error              = Class.new(StandardError)
  InvalidPhoneNumber = Class.new(Error)

  extend Dry::Initializer

  option :account_sid,  default: -> { Rails.application.credentials.twilio[:account_sid] }
  option :auth_token,   default: -> { Rails.application.credentials.twilio[:auth_token] }
  option :phone_number, default: -> { Rails.application.credentials.twilio[:phone_number] }

  def send_sms(to, message)
    client.messages.create(from: phone_number, to: to, body: message)
  rescue Twilio::REST::RestError => error
    # more details here: https://www.twilio.com/docs/api/errors/21211
    raise TwilioClient::InvalidPhoneNumber, error.message if error.code == 21211
    raise TwilioClient::Error, error.message
  end

  def client
    Twilio::REST::Client.new(account_sid, auth_token)
  end
end

