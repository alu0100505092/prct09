class ArticuloPeriodico < PublicacionesPeriodicas
    attr_accessor :sitio_pub
    def initialize(args)
        super(args)
        @sitio_pub = args[:sitio_pub]
    end  
end