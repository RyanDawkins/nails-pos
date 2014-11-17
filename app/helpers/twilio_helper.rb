class TwillioBase
	def self.createClient
		@@client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
	end
end

class TwillioSMS < TwillioBase
	def self.sendSMS(recipient, content)
		TwillioBase.createClient
		@message = @@client.account.messages.create({
			to: recipient,
			from: ENV["TWILIO_SENT_NUMBER"],
			body: content })
	end
end