import Cocoa
import Foundation

public class DatiTrasmissione{
    public var idPaese = String()
    public var idCodice = String()
    public var progressivoInvio = String()
    public var formatoTrasmissione = String()
    public var codiceDestinatario = String()
    public var pecDestinatario = String()
    
    public init(){}
}

public class DatiAnagrafici{
    public var idPaese = String()
    public var idCodice = String()
    public var codiceFiscale = String()
    public var denominazione = String()
    public var nome = String()
    public var cognome = String()
    public var regimeFiscale = String()
    public var indirizzo = String()
    public var numeroCivico = String()
    public var cap = String()
    public var comune = String()
    public var provincia = String()
    public var nazione = String()
    
    public init(){}
}

public class DatiBeniServizi{
    public var descrizione = String()
    public var quantità = String()
    public var prezzoUnitario = String()
    public var prezzoTotale = String()
    public var aliquotaIva = String()
    
    public init(){}
}

public class RiepilogoDocumento{
    public var aliquotaIva = String()
    public var imponibileImporto = String()
    public var imposta = String()
    
    public init(){}
}

public class FatturaElettronica{
    //FatturaElettronicaHeader
    public var datiTrasmissione = DatiTrasmissione()
    public var cedentePrestatore = DatiAnagrafici()
    public var cessionarioCommittente = DatiAnagrafici()
    
    //FatturaElettronicaBody
    public var tipoDocumento = String()
    public var divisa = String()
    public var data = String()
    public var numero = String()
    public var importoTotaleDelDocumento = String()
    
    public var lineeBeniServizi = [DatiBeniServizi]()
    public var riepilogoDocumento = [RiepilogoDocumento]()
    
    public init(){}
}
