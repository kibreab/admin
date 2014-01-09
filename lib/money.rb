module Money
	SECURITY_CODE = "555"
	MONEY_AV = 40000 #Nordea.money
	def self.money_in_store
		return MONEY_AV
	end

	def self.code
		SECURITY_CODE
	end
end