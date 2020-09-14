# begin
#     #Devo tentar alguma coisa
#     file = File.open('./ola')
#     if file
#         puts file.read
#     end
# rescue Exception => e 
#     puts e.backtrace
#     #Obter um possível erro
# end

def soma(n1,n2)
    n1 + n2
rescue Exception => e
    puts 'Erro ao executar a soma'
end

soma('10',5)