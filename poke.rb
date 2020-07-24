require 'rest-client'
require 'json'
require 'net/http'

class Pokemon_Abilities
    def initialize 
        @name 
        @url = 'https://pokeapi.co/api/v2/pokemon/'
    end

    def extract_abilities   
        puts "Pokemons: venusaur - caterpie - rattata - ditto - kakuna"       
        print "nome do pokemon: "
        @name = gets.chomp

        resp = RestClient.get "#{@url}/#{@name}"
        @response = JSON.parse(resp.body)["abilities"].to_json

        end

    def show_abilities
        data = @name + '-'+ Time.new.strftime('%d-%m-%y %H:%M') +'.txt'
        file = File.open(data,'a')do |f|
        @response_names = Array.new 
        @response_names= @response["name"]
        f.puts "Habilidades do #{@name}: #{@response_names}"    
            f.puts "Json de habilidades do #{@name}: #{@response}"  
        end
    end

end

 poke = Pokemon_Abilities.new
 poke.extract_abilities
 poke.show_abilities

