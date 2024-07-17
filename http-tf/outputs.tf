# produces an output value named "pokemon_pikachu"
output "pokemon_pikachu" {
  description = "API that gets the pokemon pikachu"
  value       = data.http.pokemon.response_body
}

# produces legal JSON output value named "pokemon_pikachu_json"
output "pokemon_pikachu_json" {
  description = "Get the pokemon pikachu API in json"
  value       = jsondecode(data.http.pokemon.response_body)    // note the jsondecode()
}    

