class Box 
  
  def method
    @in =10 
    puts @in
  end

  def Box.method2
    puts @in
  end 
  
  puts @in

end

b=Box.new
b.method
Box.method2