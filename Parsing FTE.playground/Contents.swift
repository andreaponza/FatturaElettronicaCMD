import Cocoa
import Foundation


class ParserBase : NSObject, XMLParserDelegate {
    var fatturaElettronica = FatturaElettronica()
    var foundCharacters = ""
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        //Array dettaglio linee
        if elementName == "DettaglioLinee" {
            let temp = DatiBeniServizi()
            self.fatturaElettronica.lineeBeniServizi.append(temp)
        }
        //Array dati riepilogo
        if elementName == "DatiRiepilogo" {
            let temp = RiepilogoDocumento()
            self.fatturaElettronica.riepilogoDocumento.append(temp)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        foundCharacters = string
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        //Dati Trasmissione
        if elementName == "ProgressivoInvio" {
            self .fatturaElettronica.datiTrasmissione.progressivoInvio = self.foundCharacters
        }
        if elementName == "FormatoTrasmissione" {
            self .fatturaElettronica.datiTrasmissione.formatoTrasmissione = self.foundCharacters
        }
        if elementName == "CodiceDestinatario" {
            self .fatturaElettronica.datiTrasmissione.codiceDestinatario = self.foundCharacters
        }
        if elementName == "PECDestinatario" {
            self .fatturaElettronica.datiTrasmissione.pecDestinatario = self.foundCharacters
        }
        
        //Dati anagrafici
        if elementName == "IdPaese" {
            if self.fatturaElettronica.cedentePrestatore.idPaese != "" && self.fatturaElettronica.datiTrasmissione.idPaese != ""
            {
                self.fatturaElettronica.cessionarioCommittente.idPaese = self.foundCharacters
            }
            else if self.fatturaElettronica.datiTrasmissione.idPaese != "" {
                self.fatturaElettronica.cedentePrestatore.idPaese = self.foundCharacters
            }
            else
            {
                self.fatturaElettronica.datiTrasmissione.idPaese = self.foundCharacters
            }
        }
           
        if elementName == "IdCodice" {
            if self.fatturaElettronica.cedentePrestatore.idCodice != "" && self.fatturaElettronica.datiTrasmissione.idCodice != ""
            {
                self.fatturaElettronica.cessionarioCommittente.idCodice = self.foundCharacters
            }
            else if self.fatturaElettronica.datiTrasmissione.idCodice != "" {
                self.fatturaElettronica.cedentePrestatore.idCodice = self.foundCharacters
            }
            else
            {
                self.fatturaElettronica.datiTrasmissione.idCodice = self.foundCharacters
            }
        }
        if elementName == "CodiceFiscale" {
            if self.fatturaElettronica.cedentePrestatore.codiceFiscale != ""  {
                self.fatturaElettronica.cessionarioCommittente.codiceFiscale = self.foundCharacters
            } else {
                self.fatturaElettronica.cedentePrestatore.codiceFiscale = self.foundCharacters
            }
        }
        if elementName == "RegimeFiscale" {
            if self.fatturaElettronica.cedentePrestatore.regimeFiscale != ""  {
                self.fatturaElettronica.cessionarioCommittente.regimeFiscale = self.foundCharacters
            } else {
                self.fatturaElettronica.cedentePrestatore.regimeFiscale = self.foundCharacters
            }
        }
        if elementName == "Denominazione" {
            if self.fatturaElettronica.cedentePrestatore.denominazione != ""  {
                self.fatturaElettronica.cessionarioCommittente.denominazione = self.foundCharacters
            } else {
                self.fatturaElettronica.cedentePrestatore.denominazione = self.foundCharacters
            }
        }
        if elementName == "Nome" {
            if self.fatturaElettronica.cedentePrestatore.nome != ""  {
                self.fatturaElettronica.cessionarioCommittente.nome = self.foundCharacters
            } else {
                self.fatturaElettronica.cedentePrestatore.nome = self.foundCharacters
            }
        }
        if elementName == "Cognome" {
            if self.fatturaElettronica.cedentePrestatore.cognome != ""  {
                self.fatturaElettronica.cessionarioCommittente.cognome = self.foundCharacters
            } else {
                self.fatturaElettronica.cedentePrestatore.cognome = self.foundCharacters
            }
        }
        if elementName == "Indirizzo" {
            if self.fatturaElettronica.cedentePrestatore.indirizzo != ""  {
                self.fatturaElettronica.cessionarioCommittente.indirizzo = self.foundCharacters
            } else {
                self.fatturaElettronica.cedentePrestatore.indirizzo = self.foundCharacters
            }
        }
        if elementName == "NumeroCivico" {
            if self.fatturaElettronica.cedentePrestatore.numeroCivico != ""  {
                self.fatturaElettronica.cessionarioCommittente.numeroCivico = self.foundCharacters
            } else {
                self.fatturaElettronica.cedentePrestatore.numeroCivico = self.foundCharacters
            }
        }
        if elementName == "CAP" {
            if self.fatturaElettronica.cedentePrestatore.cap != ""  {
                self.fatturaElettronica.cessionarioCommittente.cap = self.foundCharacters
            } else {
                self.fatturaElettronica.cedentePrestatore.cap = self.foundCharacters
            }
        }
        if elementName == "Comune" {
            if self.fatturaElettronica.cedentePrestatore.comune != ""  {
                self.fatturaElettronica.cessionarioCommittente.comune = self.foundCharacters
            } else {
                self.fatturaElettronica.cedentePrestatore.comune = self.foundCharacters
            }
        }
        if elementName == "Provincia" {
            if self.fatturaElettronica.cedentePrestatore.provincia != ""  {
                self.fatturaElettronica.cessionarioCommittente.provincia = self.foundCharacters
            } else {
                self.fatturaElettronica.cedentePrestatore.provincia = self.foundCharacters
            }
        }
        if elementName == "Nazione" {
            if self.fatturaElettronica.cedentePrestatore.nazione != ""  {
                self.fatturaElettronica.cessionarioCommittente.nazione = self.foundCharacters
            } else {
                self.fatturaElettronica.cedentePrestatore.nazione = self.foundCharacters
            }
        }
        
        //Dati fattura
        if elementName == "TipoDocumento" {
            self .fatturaElettronica.tipoDocumento = self.foundCharacters
        }
        if elementName == "Data" {
            self .fatturaElettronica.data = self.foundCharacters
        }
        if elementName == "Divisa" {
            self .fatturaElettronica.divisa = self.foundCharacters
        }
        if elementName == "Numero" {
            self .fatturaElettronica.numero = self.foundCharacters
        }
        if elementName == "ImportoTotaleDocumento" {
            self .fatturaElettronica.importoTotaleDelDocumento = self.foundCharacters
        }
        
        //Dettaglio Linee
        if elementName == "Descrizione" {
            self.fatturaElettronica.lineeBeniServizi.last?.descrizione = self.foundCharacters
        }
        if elementName == "Quantita" {
            self.fatturaElettronica.lineeBeniServizi.last?.quantità = self.foundCharacters
        }
        if elementName == "PrezzoUnitario" {
            self.fatturaElettronica.lineeBeniServizi.last?.prezzoUnitario = self.foundCharacters
        }
        if elementName == "PrezzoTotale" {
            self.fatturaElettronica.lineeBeniServizi.last?.prezzoTotale = self.foundCharacters
        }
        if elementName == "AliquotaIVA" {
            self.fatturaElettronica.lineeBeniServizi.last?.aliquotaIva = self.foundCharacters
        }
        
        //DatiRiepilogo
        if elementName == "AliquotaIVA" {
            self.fatturaElettronica.riepilogoDocumento.last?.aliquotaIva = self.foundCharacters
        }
        if elementName == "ImponibileImporto" {
            self.fatturaElettronica.riepilogoDocumento.last?.imponibileImporto = self.foundCharacters
        }
        if elementName == "Imposta" {
            self.fatturaElettronica.riepilogoDocumento.last?.imposta = self.foundCharacters
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        //print("Ok")
    }
    
    func item() -> FatturaElettronica{
        return self.fatturaElettronica
    }
}

var parserBase = ParserBase()
let xml = try? String(contentsOfFile: "/Users/andreademartino/Desktop/IT02617870593_000BD.xml")
let xmlData = xml?.data(using: .utf8)!
let parser = XMLParser(data: xmlData!)
parser.delegate = parserBase
parser.parse()




//Test
let fattura = parserBase.item()
print("\(fattura.cedentePrestatore.denominazione)\(fattura.cedentePrestatore.cognome) \(fattura.cedentePrestatore.nome)\n")

print("CLIENTE:\n\(fattura.cessionarioCommittente.denominazione)\(fattura.cessionarioCommittente.cognome) \(fattura.cessionarioCommittente.nome)")

print("Descrizione                                      Prezzo Prezzo_Tot Quant.")
var i = 0
for element in fattura.lineeBeniServizi {
    i += 1
    print("\(i) \(element.descrizione)                        \(element.prezzoUnitario) \(element.prezzoTotale) \(element.quantità)")
}

print("\nRiepilogo\n")
print("IVA Imponibile Imposta")
for element in fattura.riepilogoDocumento {
    print(element.aliquotaIva, element.imponibileImporto, element.imposta)
}
