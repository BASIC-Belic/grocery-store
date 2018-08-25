# ID, a number
# Email address, a string
# Delivery address, a hash
require 'pry'
require 'csv'

class Customer
  attr_reader :id
  attr_accessor :email, :address

  @@customers = []
  @@found_customers = []

  def initialize(id, email, address)
    @id = id
    @email = email
    @address = address
  end

  def self.all

    @@customers = CSV.open('data/customers.csv', "r+").map do |customer|
      customer
    end

    @@customers = @@customers.map do |customer|


      Customer.new(customer[0].to_i, customer[1], address = {
        street: customer[2],
        city: customer[3],
        state: customer[4],
        zip: customer[5]
        })
      end

      return @@customers

    end

    def self.find(id)
      #find the matching element in array and return it if it's there
      #else implict return of nil
      customer = @@customers.find do |customer|

        #conditional
        customer.id == id

      end

      return customer

    end


  # # self.find(id) - returns an instance of Customer where the value of the id field in the CSV matches the passed parameter
  # # Customer.find should not parse the CSV file itself. Instead it should invoke Customer.all and search through the results for a customer with a matching ID.

  # customer array
  #     ID = 123
  #     EMAIL = "a@a.co"
  #     ADDRESS = {
  #       street: "123 Main",
  #       city: "Seattle",
  #       state: "WA",
  #       zip: "98101"
  #     }



end