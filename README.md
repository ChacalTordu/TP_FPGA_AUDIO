### TP_FPGA_AUDIO

# La méthode suivie pour le développement des modèles VHDL de l'ADC et du DAC.

Dans un premier temps, nous avons découvert le projet donné. Les documents associés nous ont permis de comprendre le but de notre travail.

Notre travail consistera à simuler l'implémentation d'un module externe (PMODI2S2) qui est un module de conversation AN audio stéréo. Nous devrons donc créer un fichier externe dans lequel nous allons stocker nos donnés audios. Ce fichier s'appellera "ADC_INPUT.txt".
Suite à cela, notre programme devra récupérer ces données pour ensuite les stocker dans un registre. Ce registre sera envoyé au programme donné par notre enseignant. Nous récupérons les données en sortie pour en refaire une conversion DAC.

Dans un second temps, nous nous sommes divisé le travail (nous sommes un binôme.). L'un de nous travaillait sur l'ADC et l'autre sur le DAC.

Malheureusement, le projet n'a pas abouti. Nous n'arrivons pas à réaliser un Testbench, du projet total, satisfaisant, pour savoir si notre DAC est fonctionnel.
Nous savons seulement que notre ADC fonctionne.
Je pense que nous n'y arrivons pas à cause du fait que nous ne comprenions pas l'utilité de certains vecteurs utilisés en entrée et sortie de l'unité de contrôle.

# La méthode suivie pour tester et valider la chaîne d'acquisition une fois l'IP PMODI2S2_user implémentée dans le FPGA et utilisant le module externe PMODI2S2

Nous l'avons rédigé dans un pdf que vous trouverez dans le dossier parent.


