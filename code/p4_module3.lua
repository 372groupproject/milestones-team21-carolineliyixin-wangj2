BankAccount = {}
function BankAccount.deposite (self, n)
	self.balance = self.balance + n
end

function BankAccount.withdraw (self, n)
	self.balance = self.balance - n
end

BankAccount.deposit(Account, 200.00)
BankAccount:withdraw(100.00)

a = BankAccount
a:deposit(100.00)
a.withdraw(a, 100.00)

