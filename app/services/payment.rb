class Payment
  def self.create_customer(email)
    Stripe::Customer.create(email: email)
  end

  def self.add_card(number, exp_month, exp_year, cvc, customer)
    card = Stripe::Token.create({ card: { number: number, exp_month: exp_month, exp_year: exp_year,
                                          cvc: cvc } })

    Stripe::Customer.create_source(
      customer,
      { source: card.id }
    )
    card
  end

  def self.create_payment(description, amount, customer_id, currency, default_source)
    Stripe::Charge.create({
                            description: description,
                            amount: amount * 100,
                            customer: customer_id,
                            currency: currency,
                            source: default_source
                          })
  end
end
