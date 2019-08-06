//
//  ParserFTE.swift
//  ParsingFTE
//
//  Created by Andrea on 21/05/2019.
//  Copyright © 2019 Andrea. All rights reserved.
//

import Cocoa
import Foundation

class ParserFTE : NSObject, XMLParserDelegate {
    var fatturaElettronica = FatturaElettronica()
    var foundCharacters = ""
    var natura = [String]()
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        //Array elementi header
        if elementName == "DatiTrasmissione" {//1
            let temp = SezioneHeaderFattura()
            temp.tipo = "Dati Trasmissione"
            self.fatturaElettronica.headerFattura.append(temp)
        }
        if elementName == "CedentePrestatore" {//2
            let temp = SezioneHeaderFattura()
            temp.tipo = "Cedente/Prestatore"
            self.fatturaElettronica.headerFattura.append(temp)
        }
        if elementName == "RappresentanteFiscale" {//3
            let temp = SezioneHeaderFattura()
            temp.tipo = "RappresentanteFiscale"
            self.fatturaElettronica.headerFattura.append(temp)
        }
        if elementName == "CessionarioCommittente" {//4
            let temp = SezioneHeaderFattura()
            temp.tipo = "Cessionario/Committente"
            self.fatturaElettronica.headerFattura.append(temp)
        }
        if elementName == "TerzoIntermediarioOSoggettoEmittente" {//5
            let temp = SezioneHeaderFattura()
            temp.tipo = "TerzoIntermediarioOSoggettoEmittente"
            self.fatturaElettronica.headerFattura.append(temp)
        }
        if elementName == "SoggettoEmittente" {//6
            let temp = SezioneHeaderFattura()
            temp.tipo = "SoggettoEmittente"
            self.fatturaElettronica.headerFattura.append(temp)
        }
        
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
        //Compilazione dati header
        if elementName == "IdPaese" {
            self.fatturaElettronica.headerFattura.last?.idPaese = self.foundCharacters
        }
        if elementName == "IdCodice" {
           self.fatturaElettronica.headerFattura.last?.idCodice = self.foundCharacters
        }
        if elementName == "ProgressivoInvio" {
            self.fatturaElettronica.headerFattura.last?.progressivoInvio = self.foundCharacters
        }
        if elementName == "FormatoTrasmmissione" {
            self.fatturaElettronica.headerFattura.last?.formatoTrasmissione = self.foundCharacters
        }
        if elementName == "CodiceDestinatario" {
            self.fatturaElettronica.headerFattura.last?.codiceDestinatario = self.foundCharacters
        }
        if elementName == "PECDestinatario" {
            self.fatturaElettronica.headerFattura.last?.pecDestinatario = self.foundCharacters
        }
        if elementName == "CodiceFiscale" {
           self.fatturaElettronica.headerFattura.last?.codiceFiscale = self.foundCharacters
        }
        if elementName == "RegimeFiscale" {
           self.fatturaElettronica.headerFattura.last?.regimeFiscale = self.foundCharacters
        }
        if elementName == "Denominazione" {
           self.fatturaElettronica.headerFattura.last?.denominazione = self.foundCharacters
        }
        if elementName == "Nome" {
           self.fatturaElettronica.headerFattura.last?.nome = self.foundCharacters
        }
        if elementName == "Cognome" {
            self.fatturaElettronica.headerFattura.last?.cognome = self.foundCharacters
        }
        if elementName == "Indirizzo" {
            self.fatturaElettronica.headerFattura.last?.indirizzo = self.foundCharacters
        }
        if elementName == "NumeroCivico" {
           self.fatturaElettronica.headerFattura.last?.numeroCivico = self.foundCharacters
        }
        if elementName == "CAP" {
           self.fatturaElettronica.headerFattura.last?.cap = self.foundCharacters
        }
        if elementName == "Comune" {
          self.fatturaElettronica.headerFattura.last?.comune = self.foundCharacters
        }
        if elementName == "Provincia" {
           self.fatturaElettronica.headerFattura.last?.provincia = self.foundCharacters
        }
        if elementName == "Nazione" {
           self.fatturaElettronica.headerFattura.last?.nazione = self.foundCharacters
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
        
        //Ritenuta
        if elementName == "TipoRitenuta" {
            self .fatturaElettronica.tipoRitenuta = self.foundCharacters
        }
        if elementName == "ImportoRitenuta" {
            self .fatturaElettronica.importoRitenuta = self.foundCharacters
        }
        if elementName == "AliquotaRitenuta" {
            self .fatturaElettronica.alqRitenuta = self.foundCharacters
        }
        if elementName == "CausalePagamento" {
            self .fatturaElettronica.causalePagamento = self.foundCharacters
        }
        
        //Dati bollo
        if elementName == "BolloVirtuale" {
            self.fatturaElettronica.bolloVirtuale = self.foundCharacters
        }
        if elementName == "ImportoBollo" {
            self.fatturaElettronica.importoBollo = self.foundCharacters
        }
        
        //Dati Pagamento
        if elementName == "ModalitaPagamento" {
            self.fatturaElettronica.modalitaPagamento = self.foundCharacters
        }
        if elementName == "IBAN" {
            self.fatturaElettronica.iban = self.foundCharacters
        }
        
        //Dati Cassa Previdenziale
        if elementName == "TipoCassa" {
            self.fatturaElettronica.tipoCassa = self.foundCharacters
        }
        if elementName == "AlCassa" {
            self.fatturaElettronica.alqCassa = self.foundCharacters
        }
        if elementName == "ImportoContributoCassa" {
            self.fatturaElettronica.importoContributoCassa = self.foundCharacters
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
        if elementName == "Natura" {
            self.natura.append(foundCharacters)
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
        //Campo Natura
        i = 0
        if natura.count != 0 {
            for element in fatturaElettronica.lineeBeniServizi {
                if element.aliquotaIva == "0.00" {
                    element.natura = natura[i]
                    i += 1
                }
            }
            for element in fatturaElettronica.riepilogoDocumento {
                if element.aliquotaIva == "0.00" {
                    element.natura = fatturaElettronica.naturaEsteso(naturaCode: natura[i])
                    i += 1
                }
            }
        }
        //Fine Campo Natura
    }
    
    func fattura() -> FatturaElettronica{
        return self.fatturaElettronica
    }
}
