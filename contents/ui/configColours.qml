import QtQuick
import QtQuick.Controls as QQC2
import org.kde.kirigami as Kirigami
import org.kde.kquickcontrols 2.0 as KQControls
import org.kde.kcmutils as KCM

KCM.SimpleKCM{
    property alias cfg_windColour: windColour.color
    property alias cfg_solarColour: solarColour.color
    property alias cfg_hydroColour: hydroColour.color
    property alias cfg_nuclearColour: nuclearColour.color
    property alias cfg_biomassColour: biomassColour.color
    property alias cfg_importColour: importColour.color
    property alias cfg_gasColour: gasColour.color
    property alias cfg_coalColour: coalColour.color
    property alias cfg_otherColour: otherColour.color
    property alias cfg_useDefaultTextColour: useDefaultTextColour.checked
    property alias cfg_customTextColour: customTextColour.color

    Kirigami.FormLayout {
        id: page
        Kirigami.Heading {
            text: "Text"
            level: 2
        }
        QQC2.CheckBox {
        id: useDefaultTextColour
        Kirigami.FormData.label: i18n("Use system colour default:")
        checked: plasmoid.configuration.useDefaultTextColour
        }
        KQControls.ColorButton {
            id: customTextColour
            Kirigami.FormData.label: i18n("Custom colour:")
            enabled: !cfg_useDefaultTextColour
        }
        Kirigami.Heading {
            text: "Pie Slice Colours"
            level: 2
        }
        KQControls.ColorButton {
            id: windColour
            Kirigami.FormData.label: i18n("Wind:")
        }
        KQControls.ColorButton {
            id: solarColour
            Kirigami.FormData.label: i18n("Solar:")
        }
        KQControls.ColorButton {
            id: hydroColour
            Kirigami.FormData.label: i18n("Hydroelectic:")
        }
        KQControls.ColorButton {
            id: nuclearColour
            Kirigami.FormData.label: i18n("Nuclear:")
        }
        KQControls.ColorButton {
            id: biomassColour
            Kirigami.FormData.label: i18n("Biomass:")
        }
        KQControls.ColorButton {
            id: importColour
            Kirigami.FormData.label: i18n("Import:")
        }
        KQControls.ColorButton {
            id: gasColour
            Kirigami.FormData.label: i18n("Gas:")
        }
        KQControls.ColorButton {
            id: coalColour
            Kirigami.FormData.label: i18n("Coal:")
        }
        KQControls.ColorButton {
            id: otherColour
            Kirigami.FormData.label: i18n("Other sources:")
        }
    }
}