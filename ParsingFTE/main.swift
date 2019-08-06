//
//  main.swift
//  ParsingFTE
//
//  Created by Andrea on 21/05/2019.
//  Copyright © 2019 Andrea. All rights reserved.
//

import Cocoa
import Foundation


//Test
var parserFTE = ParserFTE()
var keyboard = FileHandle.standardInput
var data = keyboard.availableData
//var data = try Data(contentsOf: URL(fileURLWithPath: "/Users/andreademartino/Desktop/ParsingFTE/moretti.xml"))
let parser = XMLParser(data: data)
parser.delegate = parserFTE
parser.parse()

let fattura = parserFTE.fattura()

//Fornitore
for element in fattura.headerFattura {
    if element.tipo == "Cedente/Prestatore" {
        print("\(element.denominazione)\(element.cognome) \(element.nome)")
        print("\(element.indirizzo) \(element.numeroCivico)")
        print("\(element.cap) \(element.comune) \(element.provincia) \(element.nazione)")
        print("PIVA: \(element.idPaese)\(element.idCodice) CF: \(element.codiceFiscale)")
    }
}

//Cliente
print("\nCliente:")
for element in fattura.headerFattura {
    if element.tipo == "Cessionario/Committente" {
        print("\(element.denominazione)\(element.cognome) \(element.nome)")
        print("\(element.indirizzo) \(element.numeroCivico)")
        print("\(element.cap) \(element.comune) \(element.provincia) \(element.nazione)")
        print("PIVA: \(element.idPaese)\(element.idCodice) CF: \(element.codiceFiscale)")
    }
}
if fattura.headerFattura.first!.codiceDestinatario != "" {
    print("Cod. Destinatario: \(fattura.headerFattura.first!.codiceDestinatario)")
}
if fattura.headerFattura.first!.pecDestinatario != "" {
    print("PEC: \(fattura.headerFattura.first!.pecDestinatario)")
}

//Tabella Dati documento
let tipoDocumento = TextTableColumn(header: "Tipo Documento")
let numeroDocumento = TextTableColumn(header: "Numero")
let dataDocumento = TextTableColumn(header: "Data.")
var tabDatiDoc = TextTable(columns: [tipoDocumento, numeroDocumento, dataDocumento])
tabDatiDoc.addRow(values: [fattura.tipoDocumentoEsteso(), fattura.numero, fattura.dataDocumento()])
print(tabDatiDoc.render())

//Tabella dati Prodotti
let item = TextTableColumn(header: "N")
let descrizione = TextTableColumn(header: "Descrizione")
let prezzo = TextTableColumn(header: "Prezzo")
let prezzo_Tot = TextTableColumn(header: "Prezzo_Tot")
let quant = TextTableColumn(header: "Quantità")
let alq_iva = TextTableColumn(header: "Alq IVA")
let natura = TextTableColumn(header: "Es.")
var table = TextTable(columns: [item, descrizione, prezzo, quant, prezzo_Tot, alq_iva, natura])
var i = 0
for element in fattura.lineeBeniServizi {
    i += 1
    table.addRow(values: [i, element.descrizione, element.prezzoUnitario, element.quantità, element.prezzoTotale, element.aliquotaIva, element.natura])
}
let tableString = table.render()
print(tableString)

//Tabella Cassa Previdenziale
if fattura.importoContributoCassa != "" {
    let tipoCassa = TextTableColumn(header: "Tipo Cassa")
    let alCassa = TextTableColumn(header: "Alq. Cassa")
    let importoContributoCassa = TextTableColumn(header: "Importo Cassa")
    var tabCassa = TextTable(columns: [tipoCassa, alCassa, importoContributoCassa])
    tabCassa.addRow(values: [fattura.tipoCassaEsteso(), fattura.alqCassa, fattura.importoContributoCassa])
    print(tabCassa.render())
}

//TabellaRitenuta
if fattura.tipoRitenuta != "" {
    let tipoRitenuta = TextTableColumn(header: "Tipo Ritenuta")
    let importoRitenuta = TextTableColumn(header: "ImportoRitenuta")
    let aliquotaRitenuta = TextTableColumn(header: "Alq.")
    let causalePagamentoRit = TextTableColumn(header: "Causale Pagamento")
    var tabRitenuta = TextTable(columns: [tipoRitenuta, importoRitenuta, aliquotaRitenuta, causalePagamentoRit])
    tabRitenuta.header = "Ritenuta"
    tabRitenuta.addRow(values: [fattura.tipoRitenuta, fattura.importoRitenuta, fattura.alqRitenuta, fattura.causalePagamento])
    print(tabRitenuta.render())
}

//Tabella Bollo
if fattura.importoBollo != "" {
    let bolloVirtuale = TextTableColumn(header: "Bollo")
    let importoBollo = TextTableColumn(header: "Importo")
    var tabBollo = TextTable(columns: [bolloVirtuale, importoBollo])
    tabBollo.addRow(values: [fattura.bolloVirtuale, fattura.importoBollo])
    print(tabBollo.render())
}

//Tabella Riepilogo
let imponibile = TextTableColumn(header: "Imponibile")
let imposta = TextTableColumn(header: "Imposta")
var tabRiepilogo = TextTable(columns: [imponibile, alq_iva, imposta, natura]) //header natura dichiarata già nella tabella beni e servizi
tabRiepilogo.header = "Totale Documento \(fattura.importoTotaleDelDocumento) €"

for element in fattura.riepilogoDocumento {
    tabRiepilogo.addRow(values: [element.imponibileImporto, element.aliquotaIva, element.imposta, element.natura])
}
print(tabRiepilogo.render())

//Tabella modalità pagamento
if fattura.modalitaPagamento == "MP05" {
    let modalitaPagamento = TextTableColumn(header: "Modalità Pagamento")
    let iban = TextTableColumn(header: "IBAN")
    var tabPagamento = TextTable(columns: [modalitaPagamento, iban])
    tabPagamento.addRow(values: [fattura.modalitaPagamentoEsteso(modalitaPagamentoCode: fattura.modalitaPagamento), fattura.iban])
    print(tabPagamento.render())
} else {
    let modalitaPagamento = TextTableColumn(header: "Modalità Pagamento")
    var tabPagamento = TextTable(columns: [modalitaPagamento])
    tabPagamento.addRow(values: [fattura.modalitaPagamentoEsteso(modalitaPagamentoCode: fattura.modalitaPagamento)])
    print(tabPagamento.render())
}
