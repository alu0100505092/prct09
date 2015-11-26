class DocumentoElectronico < PublicacionesPeriodicas
    def initialize(args)
        super(args)
        @sitio_pub = args[:sitio_pub]
    end    
end