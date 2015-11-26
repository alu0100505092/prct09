class ArticuloRevista < PublicacionesPeriodicas
    attr_accessor :volumen_revista, :sitio_pub
    def initialize(args)
        super(args)
        @volumen_revista = args[:volumen_revista]
        @sitio_pub = args[:sitio_pub]
    end    
end    