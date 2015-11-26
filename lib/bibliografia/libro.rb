class Libro 
    attr_accessor :autor, :titulo, :serie, :editorial, :edicion, :f_pub, :isbn
    def initialize(args)
        @autor = args[:autor]
        @titulo = args[:titulo]
        @serie = args[:serie]
        @editorial = args[:editorial]
        @edicion = args[:edicion]
        @f_pub = args[:f_pub]
        @isbn = args[:isbn]
    end
    
    
    def to_s
        names =""
        isbns =""
        i=0
        while i < @autor.count
            if i != @autor.count-1
                names= names + "#{@autor[i]}, "
            else
                names= names + "#{@autor[i]}."
            end
            i=i+1
        end
        i=0
        while i < @isbn.count
            isbns= isbns + "#{@isbn[i]}\n"
            i=i+1
        end
        "#{names}\n#{@titulo}\n#{@serie}\n#{@editorial};\n#{@edicion}\n(#{@f_pub})\n#{isbns}"
    end
end