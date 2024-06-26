package meta.states.substate.desktoptions;

import meta.states.*;
import meta.states.substate.*;
import meta.data.options.*;

class DesktopNoteSettingsSubstate extends DesktopBaseOptions {
    public function new()
    {
        var option:DesktopOption = new DesktopOption('Note Skin', //Name
            'Changes how notes look. Quants change colour depending on the beat it\'s at, while vanilla is normal FNF', //Description
            'noteSkin', //Save data variable name
            'string', //Variable type
            'Vanilla',
            ['Vanilla','Quants', 'QuantStep']
        ); //Default value
        addOption(option);

        //odd
        var option:DesktopOption = new DesktopOption('Customize',
            'Change your note colours\n[Press A]',
            'swapNoteOption',
            'button',
        true);

        option.callback = function(){
            switch(ClientPrefs.data.noteSkin){
                case 'Quants':
                #if mobile
                removeVirtualPad();
                #end
                    openSubState(new QuantNotesSubState());
                case 'QuantStep':
                #if mobile
                removeVirtualPad();
                #end
                    openSubState(new QuantNotesSubState());
                default:
                #if mobile
                removeVirtualPad();
                #end
                    openSubState(new NotesSubState());
            }
        }
        addOption(option);

        super();
    }

}