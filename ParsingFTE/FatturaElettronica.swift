//
//  FatturaElettronica.swift
//  ParsingFTE
//
//  Created by Andrea on 21/05/2019.
//  Copyright © 2019 Andrea. All rights reserved.
//

import Cocoa
import Foundation



class SezioneHeaderFattura{
    var tipo = String()
    var progressivoInvio = String()
    var formatoTrasmissione = String()
    var codiceDestinatario = String()
    var pecDestinatario = String()
    var idPaese = String()
    var idCodice = String()
    var codiceFiscale = String()
    var denominazione = String()
    var nome = String()
    var cognome = String()
    var regimeFiscale = String()
    var indirizzo = String()
    var numeroCivico = String()
    var cap = String()
    var comune = String()
    var provincia = String()
    var nazione = String()
    
    init(){}

}

class DatiBeniServizi{
    var descrizione = String()
    var quantità = String()
    var prezzoUnitario = String()
    var prezzoTotale = String()
    var aliquotaIva = String()
    var natura = String()
    
    init(){}
}

class RiepilogoDocumento{
    var aliquotaIva = String()
    var imponibileImporto = String()
    var imposta = String()
    var natura = String()
    
    init(){}
}

class FatturaElettronica{
    //FatturaElettronicaHeader
    var headerFattura = [SezioneHeaderFattura]()
    
    //FatturaElettronicaBody
    var tipoDocumento = String()
    var divisa = String()
    
    var data = String()
    
    var numero = String()
    var importoTotaleDelDocumento = String()
    
    //Ritenuta
    var tipoRitenuta = String()
    var importoRitenuta = String()
    var alqRitenuta = String()
    var causalePagamento = String()
    
    //Bollo
    var bolloVirtuale = String()
    var importoBollo = String()
    
    //Dati Cassa
    var tipoCassa = String()
    var alqCassa = String()
    var importoContributoCassa = String()
    var imponibileCassa = String()
    var alqIvaCassa = String()
    var ritenutaCassa = String()
    var naturaCassa = String()
    var riferimentoAmministrazioneCassa = String()
    
    var lineeBeniServizi = [DatiBeniServizi]()
    var riepilogoDocumento = [RiepilogoDocumento]()
    
    //Pagamento
    var modalitaPagamento = String()
    var iban = String()
    
    //Conversione Data documento
    func dataDocumento() -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        
        if let date = dateFormatterGet.date(from: self.data) {
            return dateFormatterPrint.string(from: date)
        } else {
            return "There was an error decoding the string"
        }
    }
    
    func tipoDocumentoEsteso () -> String {
        switch self.tipoDocumento {
        case "TD01":
            return "TD01 - Fattura"
        case "TD02":
            return "TD02 - Acconto/Anticipo su fattura"
        case "TD03":
            return "TD03 - Acconto/Anticipo su parcella"
        case "TD04":
            return "TD04 - Nota di Credito"
        case "TD05":
            return "TD05 - Nota di Debito"
        case "TD06":
            return "TD06 - Parcella"
        case "TD07":
            return "TD07 - Fattura semplificata"
        case "TD08":
            return "Nota di credito semplificata"
        default:
            return self.tipoDocumento
        }
    }
    
    func tipoCassaEsteso() -> String {
        switch self.tipoCassa {
        case "TC01":
            return "TC01 Cassa nazionale previdenza e assistenza avvocati"
        case "TC02":
            return "TC02 Cassa previdenza dottori commercialisti"
        case "TC03":
            return "TC03 Cassa previdenza e assistenza geometri"
        case "TC04":
            return "TC04 Cassa nazionale previdenza e assistenza ingegneri e architetti liberi professionisti"
        case "TC05":
            return "TC05 Cassa nazionale del notariato"
        case "TC06":
            return "TC06 Cassa nazionale previdenza e assistenza ragionieri e periti commerciali"
        case "TC07":
            return "TC07 Ente nazionale assistenza agenti e rappresentanti di commercio (ENASARCO)"
        case "TC08":
            return "TC08 Ente nazionale previdenza e assistenza consulenti del lavoro (ENPACL)"
        case "TC09":
            return "TC09 Ente nazionale previdenza e assistenza medici (ENPAM)"
        case "TC10":
            return "TC10 Ente nazionale previdenza e assistenza farmacisti (ENPAF)"
        case "TC11":
            return "TC11 Ente nazionale previdenza e assistenza veterinari (ENPAV)"
        case "TC12":
            return "TC12 Ente nazionale previdenza e assistenza impiegati dell'agricoltura (ENPAIA)"
        case "TC13":
            return "TC13 Fondo previdenza impiegati imprese di spedizione e agenzie marittime"
        case "TC14":
            return "Istituto nazionale previdenza giornalisti italiani (INPGI)"
        case "TC15":
            return "Opera nazionale assistenza orfani sanitari italiani (ONAOSI)"
        case "TC16":
            return "Cassa autonoma assistenza integrativa giornalisti italiani (CASAGIT)"
        case "TC17":
            return "Ente previdenza periti industriali e periti industriali laureati (EPPI)"
        case "TC18":
            return "Ente previdenza e assistenza pluricategoriale (EPAP)"
        case "TC19":
            return "Ente nazionale previdenza e assistenza biologi (ENPAB)"
        case "TC20":
            return "Ente nazionale previdenza e assistenza professione infermieristica (ENPAPI)"
        case "TC21":
            return "Ente nazionale previdenza e assistenza psicologi (ENPAP)"
        case "TC22":
            return "TC22 INPS"
        default:
            return self.tipoCassa
        }
    }
    
    //Conversione codice natura in descrizione
    func naturaEsteso(naturaCode: String) -> String {
        switch naturaCode {
        case "N1":
            return "N1 - Escluse ex art. 15"
        case "N2":
            return "N2 - Non soggette"
        case "N3":
            return "N3 - Non Imponibili"
        case "N4":
            return "N4 - Esenti"
        case "N5":
            return "N5 - Regime del Margine"
        default:
            return naturaCode
        }
    }
    
    //Modalità pagamento
    func modalitaPagamentoEsteso(modalitaPagamentoCode: String) -> String {
        switch modalitaPagamentoCode {
        case "MP01":
            return "Contanti"
        case "MP02":
            return "Assegno"
        case "MP03":
            return "Assegno circolare"
        case "MP04":
            return "Contanti presso tesoreria"
        case "MP05":
            return "Bonifico"
        default:
            return modalitaPagamentoCode
        }
    }
}
