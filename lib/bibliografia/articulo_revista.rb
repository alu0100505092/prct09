class ArticuloRevista < PublicacionesPeriodicas
    attr_accessor :volumen_revista
    def initialize(args)
        super(args)
        @volumen_revista = args[:volumen_revista]
    end    
end    