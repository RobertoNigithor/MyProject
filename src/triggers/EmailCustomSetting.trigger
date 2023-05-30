// Prima di aggiornare un Account richiama la classe, passandogli la lista dei nuovi acc creati
// In questo caso come vediamo vengono passati la lista dei nuovi account inseriti e
// una mappa di <Ids,Account> vecchi
trigger EmailCustomSetting on Account (before update) {
    //EmailCustomSettingClass.setup(Trigger.New,Trigger.oldMap); // Passo Lista Account e Mappa ID-Account

}