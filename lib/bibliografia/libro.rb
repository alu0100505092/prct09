class Libro < PublicacionesPeriodicas
    
    attr_accessor :serie, :editorial, :edicion, :isbn
    def initialize(args)
        @serie = args[:serie]
        @editorial = args[:editorial]
        @edicion = args[:edicion]
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