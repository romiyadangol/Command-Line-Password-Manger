require 'bcrypt'
require 'securerandom'


class PasswordManager
    def initialize()#initialize
        @passwords = {} #hash
    end

    #add password
    def add_password(service, username, password)
        @passwords[service] = {
            username = username,
            password = encrypt_password(password)
        }
        save_passwords
    end

    #get password
    def get_password(service)
        if @passwords.key?(service)
            password = @passwords[service][:password]
            decrypt_password(password)
        else
            "Service Not Found"
        end
    end

    #get username
    def username(service)
        if @passwords.key?(service)
            @passwords[service][:username]

    end

    private
    #encrypts message
    def encrypt_password(password)
        BCrypt::Password.create(password)
    end

    #decrypts message
    def decrypt_password(encrypt_password)
        BCrypt::Password.new(encrypt_password)
    end

    def load_password

    end

    def save_passwords

    end



end


#instance
password_manager = PasswordManager.new

def display_menu
    puts "----------------------------------------------------------------------------------"
    puts "                              Password Manager                                    "
    puts "----------------------------------------------------------------------------------"
end
loop do
    display_menu
    puts "1. Add Password"
    puts "2. Get Paasword"
    puts "3. Generate Password"
    puts "4. List Services"
    puts "5. Exit"

    puts "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
        puts "Enter Service"
        service = gets.chomp

        puts "Enter Username"
        username = gets.chomp

        puts "Enter Password"
        password = gets.chomp

        password_manager.add_password(service, username, password)

    when 2
        puts "Enter Service"
        service = gets.chomp

        puts "Username: #{password_manager.get_username(service)}"
        puts "Password: #{password_manager.get_password(service)}"

    end
end



































