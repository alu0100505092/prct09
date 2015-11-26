require 'spec_helper'

describe Bibliografia do
    before :all do 
        @book  = Libro.new({:referencia => "2", :autor => ["Dave Thomas", "Andy Hunt", "Chad Fowler"], :titulo => "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide", :serie => "The Facets of Ruby", :editorial => "Pragmatic Bookshelf", :edicion => "4 edition", :f_pub => "July 7, 2013", :isbn => ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"]})
        @book1 = Libro.new({:referencia => "4", :autor => ["Scott Chacon"], :titulo => "Pro Git 2009th Edition", :serie => "Pro", :editorial => "Apress", :edicion => "2009 edition", :f_pub => "August 27, 2009", :isbn => ["ISBN-13: 978-1430218333", "ISBN-10: 1430218339"]})
        @book2 = Libro.new({:referencia => "5", :autor => ["David Flanagan", "Yukihiro Matsumoto"], :titulo => "The Ruby Programming Language", :serie => "Serie", :editorial => "O’Reilly Media", :edicion => " 1 edition", :f_pub => "February 4, 2008", :isbn => ["ISBN-10: 0596516177", "ISBN-13: 978-0596516178"]})
        @book3 = Libro.new({:referencia => "7", :autor => ["David Chelimsky", "Dave Astels", " Bryan Helmkamp", "Dan North", "Zach Dennis", "Aslak Hellesoy"], :titulo => "The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends", :serie => "The Facets of Ruby", :editorial => "Pragmatic Bookshelf", :edicion => "1 edition", :f_pub => "December 25, 2010", :isbn => ["ISBN-10: 1934356379", "ISBN-13: 978-1934356371",]})
        @book4 = Libro.new({:referencia => "6", :autor => ["Richard E. Silverman"], :titulo => "Git Pocket Guide", :serie => "Serie", :editorial => "O’Reilly Media", :edicion => "1 edition", :f_pub => "August 2, 2013", :isbn => ["ISBN-10: 1449325866", "ISBN-13: 978-1449325862"]})    
        @art_rev = ArticuloRevista.new({:referencia => "3", :autor => ["Juan Castagnino"], :titulo => "Tecnicas, materiales y aplicaicones en nanotecnologia", :sitio_pub => "Bioquimica Clinica", :volumen_revista => "24", :num_pag => "2", :f_pub => "April, 2007"})
        @art_per = ArticuloPeriodico.new({:referencia => "2", :autor => ["Adam Davidson"], :titulo => "Saving the World, Startup-Style", :sitio_pub => "The New York Times", :num_pag => "3", :f_pub => "Nov 17, 2015"})
        @dc_elec = DocumentoElectronico.new({:referencia => "5", :autor => ["Kike Garcia"], :titulo => "Internet Explorer empieza a sospechar que no es tu navegador predeterminado", :sitio_pub => "elmundotoday.com", :num_pag => "1", :f_pub => "September 24, 2013"})
        
        @nodo  = Nodo.new(@book)
        
        
        @lista = Lista.new(0)
        @lista1 = Lista.new(0)  
        
        
    end  

    
    context "Nodo" do
        it "Debe existir un Nodo de la lista con sus datos y su siguiente" do
            expect(@nodo.value).to eq(@book)
            expect(@nodo.next).to eq(nil)
        end
    end    
    
    context "Lista doblemente enlazada" do
        it "Se extrae el primer elemento de la lista" do
            @lista.push(@book4)
            @lista.push(@art_rev)
            @lista.push(@book2)
            @lista.push(@art_per)
            @lista.push(@book)
            @lista.ext
            expect(@lista.inicio).to eq(@art_per)
        end
        
        it "Comprobar herencia" do
            expect(DocumentoElectronico.superclass).is_a?(PublicacionesPeriodicas)
        end    
        
        it "Se puede insertar un elemento" do
            @lista.push(@book4)
            expect(@lista.inicio).to eq(@book4)
        end
        
        it "Se pueden insertar varios elementos" do
            @lista.pushf(@book4)
            @lista.push(@art_rev)
            @lista.push(@book2)
            @lista.push(@dc_elec)
            @lista.push(@book)
            expect(@lista.inicio).to eq(@book)
            @lista.ext
            expect(@lista.inicio).to eq(@dc_elec)
            @lista.ext
            expect(@lista.inicio).to eq(@book2)
            @lista.ext
            expect(@lista.inicio).to eq(@art_rev)
            @lista.ext
            expect(@lista.inicio).to eq(@book4)
        end
        
        it "Extraer el ultimo elemento del examen" do
            @lista.pushf(@art_rev)
            @lista.push(@book3)
            @lista.push(@art_per)
            @lista.push(@book1)
            @lista.push(@dc_elec)
            @lista.extfin
            expect(@lista.fin).to eq(@book3)
        end    
        
        it "Las lista enlazadas se deben poder recorrer en ambos sentidos" do
            @lista.pushf(@dc_elec)
            @lista.push(@book3)
            @lista.push(@art_per)
            @lista.push(@book2)
            @lista.push(@art_rev)
            @lista.push(@book1)
            @lista.push(@book)
            expect(@lista.inicio).to eq(@book)
            expect(@lista.fin).to eq(@dc_elec)
            @lista.ext
            @lista.extfin
            expect(@lista.inicio).to eq(@book1)
			expect(@lista.fin).to eq(@book3)
            @lista.ext
            @lista.extfin
            expect(@lista.inicio).to eq(@art_rev)
			expect(@lista.fin).to eq(@art_per)
            @lista.ext
            @lista.extfin
            expect(@lista.inicio).to eq(@book2)
            expect(@lista.fin).to eq(@book2)
        end
        
        it "Debe existir una lista con su cabeza" do
            @lista.push(@book)
            expect(@lista.inicio).to eq(@book)
        end
    end
    
    context "Comparable" do
        it "La referencia es mas pequeña" do
            expect(@book > @book1).to eq(false)
        end 
        
        it "La referencia es mayor" do
            expect(@book4 <= @book3).to eq(true)
        end
        
        it "Titulo mas pequeño que otro titulo" do
            expect(@art_rev.titulo.size < @art_per.titulo.size).to eq(false)
        end    
        
        it "Titulo mayor que otro titulo" do
            expect(@dc_elec.titulo.size > @art_rev.titulo.size).to eq(true)
        end
    end    
    
    context "Enumerable" do
        it "La lista es enumerable" do
            string = ""
            @lista.each do |l| 
            string << "probando"
            string << "\n" 
            end
            expect(string).to eq("probando\n"*5)
        end
        
        it "Debe contar los elementos de la lista" do
            @lista1.pushf(@book4)
            @lista1.push(@art_rev)
            @lista1.push(@book2)
            @lista1.push(@art_per)
            @lista1.push(@book1)
            @lista1.push(@dc_elec)
            @lista1.push(@book)
            expect(@lista1.count).to eq(7)
        end
        
        it "Drop" do
            expect(@lista1.drop(7)).to eq([])
        end
        
        it "Se puede hacer un each" do
		    @lista1.each{|i| i}
	    end
	    
	    it "Debe iteriar en la lista enlazada : min" do
	        @lista1.pushf(@book4)
            @lista1.push(@art_rev)
            @lista1.push(@book2)
            @lista1.push(@art_per)
            @lista1.push(@book1)
            @lista1.push(@dc_elec)
            @lista1.push(@book)
            expect(@lista1.min_by{|nodo| nodo.length} != @dc_elec).to eq(true)
        end
        
        it "Debe iteriar en la lista enlazada : max" do
            @lista1.pushf(@book4)
            @lista1.push(@book2)
            expect(@lista1.max_by{|nodo| nodo.length} != @book4).to eq(true)
        end
        
        it "Debe iteriar en la lista enlazada : sort" do
            expect(@lista1.sort_by {|palabra| palabra.length} != @lista).to eq(true)
        end
    end    
end
