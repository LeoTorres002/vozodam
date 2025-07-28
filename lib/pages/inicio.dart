import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  _TranslationScreenState createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<Inicio> {
  String language1 = "O'dam";
  String language2 = "Español";
  String inputText = '';
  String translatedText = '';

  // Diccionarios para traducción
  final Map<String, String> odamToSpanish = {
    "Jix koo'k guñ moo'": "Me duele la cabeza",
    "Jix choiñdhix iñ": "Tengo fiebre",
    "Jix koo'k guñ boo'k": "Siento dolor en el estómago",
    "Cham bhai ibh+ iñ": "No puedo respirar bien",
    "Xikoo´l chum jim": "Estoy mareado",
    "Jix koo´k guñ kuxbho": "Tengo tos y dolor de garganta",
    "Guñ juu´r xi jim": "Mi corazón late muy rápido",
    "Jix magoo´ñ iñ": "Estoy muy cansado y débil",
    "Jiñ pailbiñ guu´i na tu duduadhiñ": "Necesito ayuda médica",
    "Paa´ k+k gu´ hospital nar amub": "¿Dónde está el hospital más cercano?",
    "Jix koo´k guñ kuu´xbo guio nañ cham bhai i´bh+": "Tengo mucha tos y no puedo respirar bien",
    "Jix koo´k guñ bhásto": "Siento un dolor fuerte en el pecho",
    "Xikoo´l chum jim jix i´om cham bhai nañ k+kboo´": "Me siento muy mareado y no puedo mantenerme de pie",
    "Jix choiñdhix iñ i´om guio nax koo´k bh+ix guñ tuuku´": "Tengo fiebre alta y me duele todo el cuerpo",
    "Jix choiñ nañ pai duk xii´ba": "Siento un ardor al orinar",
    "Jix i´om jim na´ pai b+bh+ guñ ++´r": "Mi presión arterial está muy alta",
    "Jix koo´k guñ a´oo miñ uli´a am": "Tengo dolor en las articulaciones, especialmente en las rodillas",
    "Jix magoo´ñ iñ cham bhai nañ tu jax dhu ñia": "Estoy muy cansado y no tengo energía",
    "Jix koo´k guñ buupui guio nañ ioo´": "Me pican mucho los ojos y estoy estornudando",
    "Jix koo´k guñ moo´ guio na xikolk tum jim": "Tengo dolor de cabeza y mareo constante",
    "Ach bha ji´ na jich t+ guia, cham bhai tu ta´tda": "Nosotros venimos a qué nos atiendan, nos sentimos mal",
    "Ach bha ji´ nam baa´ jich makia gu´i na tu k+n tum duduar nach gux kakoo´k": "Llegamos aquí para que nos den algunos medicamentos porque estamos enfermos",
    "Ach bha ji´ nam baa´ jich t+guia, amp+x jix kakoo´k ich": "Nosotros venimos a qué nos revisen y nos den tratamiento, no nos sentimos bien últimamente",
  };

  late Map<String, String> spanishToOdam = {
    "Me duele la cabeza": "Jix koo'k guñ moo",
    "Tengo fiebre": "Jix choiñdhix iñ",
    "Siento dolor en el estómago": "Jix koo'k guñ boo'k",
    "No puedo respirar bien": "Cham bhai ibh+ iñ",
    "Estoy mareado": "Xikoo´l chum jim",
    "Tengo tos y dolor de garganta": "Jix koo´k guñ kuxbho",
    "Mi corazón late muy rápido": "Guñ juu´r xi jim",
    "Estoy muy cansado y débil": "Jix magoo´ñ iñ",
    "Necesito ayuda médica": "Jiñ pailbiñ guu´i na tu duduadhiñ",
    "¿Dónde está el hospital más cercano?": "Paa´ k+k gu´ hospital nar amub",
    "Tengo mucha tos y no puedo respirar bien": "Jix koo´k guñ kuu´xbo guio nañ cham bhai i´bh+",
    "Siento un dolor fuerte en el pecho": "Jix koo´k guñ bhásto",
    "Me siento muy mareado y no puedo mantenerme de pie": "Xikoo´l chum jim jix i´om cham bhai nañ k+kboo´",
    "Tengo fiebre alta y me duele todo el cuerpo": "Jix choiñdhix iñ i´om guio nax koo´k bh+ix guñ tuuku´",
    "Siento un ardor al orinar": "Jix choiñ nañ pai duk xii´ba",
    "Mi presión arterial está muy alta": "Jix i´om jim na´ pai b+bh+ guñ ++´r",
    "Tengo dolor en las articulaciones, especialmente en las rodillas": "Jix koo´k guñ a´oo miñ uli´a am",
    "Estoy muy cansado y no tengo energía": "Jix magoo´ñ iñ cham bhai nañ tu jax dhu ñia",
    "Me pican mucho los ojos y estoy estornudando": "Jix koo´k guñ buupui guio nañ ioo´",
    "Tengo dolor de cabeza y mareo constante": "Jix koo´k guñ moo´ guio na xikolk tum jim",
    "Nosotros venimos a qué nos atiendan, nos sentimos mal": "Ach bha ji´ na jich t+ guia, cham bhai tu ta´tda",
    "Llegamos aquí para que nos den algunos medicamentos porque estamos enfermos": "Ach bha ji´ nam baa´ jich makia gu´i na tu k+n tum duduar nach gux kakoo´k",
    "Nosotros venimos a qué nos revisen y nos den tratamiento, no nos sentimos bien últimamente": "Ach bha ji´ nam baa´ jich t+guia, amp+x jix kakoo´k ich",
  };
  @override
  void initState() {
    super.initState();

    // Invertir el mapa odamToSpanish en initState
    spanishToOdam = {for (var entry in odamToSpanish.entries) entry.value: entry.key};
  }

  void swapLanguages() {
    setState(() {
      String temp = language1;
      language1 = language2;
      language2 = temp;
      inputText = ''; // Resetear el texto de entrada
      translatedText = ''; // Resetear la traducción
    });
  }

  void translateText(String text) {
    setState(() {
      if (language1 == "O'dam" && language2 == "Español") {
        translatedText = odamToSpanish[text] ?? "Traducción no encontrada";
      } else if (language1 == "Español" && language2 == "O'dam") {
        translatedText = spanishToOdam[text] ?? "Traducción no encontrada";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'VOZ O\'DAM',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(language1, style: const TextStyle(fontSize: 18, color: Colors.white)),
                IconButton(
                  icon: const Icon(Icons.swap_horiz_rounded, color: Colors.orange),
                  onPressed: swapLanguages,
                ),
                Text(language2, style: const TextStyle(fontSize: 18, color: Colors.white)),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  buildTranslationBox(language1, true), // Cuadro para el idioma 1
                  const SizedBox(height: 20),
                  buildTranslationBox(language2, false), // Cuadro para el idioma 2
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.g_translate), label: 'Traductor'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Busqueda'),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }

  Widget buildTranslationBox(String language, bool isInput) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: isInput
          ? SizedBox(
        width: double.infinity, // Asegura que el widget no desborde horizontalmente
        child: DropdownButtonFormField<String>(
          value: inputText.isEmpty ? null : inputText,
          dropdownColor: Theme.of(context).colorScheme.surface,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Seleccionar palabra",
            hintStyle: const TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          isExpanded: true, // Permite que los textos largos no se desborden
          items: dictionaryKeys(language).map((word) {
            return DropdownMenuItem(
              value: word,
              child: Text(
                word,
                style: const TextStyle(color: Colors.white),
                softWrap: true, // Permite que el texto se envuelva en varias líneas
                overflow: TextOverflow.visible, // Muestra todo el texto si es necesario
              ),
            );
          }).toList(),
          onChanged: (selectedWord) {
            if (selectedWord != null) {
              setState(() {
                inputText = selectedWord;
                translateText(selectedWord);
              });
            }
          },
        ),
      )


          : TextField(
        controller: TextEditingController(text: translatedText),
        readOnly: true,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Traducción",
          hintStyle: const TextStyle(color: Colors.white54),
          border: InputBorder.none,
        ),
        maxLines: null,
        textAlignVertical: TextAlignVertical.top,
      ),
    );
  }

  List<String> dictionaryKeys(String language) {
    if (language == "O'dam") {
      return odamToSpanish.keys.toList();
    } else {
      return spanishToOdam.keys.toList();
    }
  }
}
