# moni

A simple app that fetches data from an API and displays it on a screen with two tabs

## Getting Started

### File Structure 

.
├── android/app/main/res/   # Includes app Icons 
├── assets/
    .── fonts               # folder containing DMSans font used in the app
    .── icons               # folder containing SVG Icons used in the app
    .── images              # folder containing images and Moni logo
├── test                    # Automated tests 
├── lib/                    # Starting folder for dart source code
    .── main.dart           # app starting point    
    .── core/
        .── constants/
            .── api.dart    # apis
        .── models/
            .── agent.dart
            .── cluster.dart
        .── services/
                fetch_cluster.dart
    .── views/
        .── screens/
            .── mycluster/
                .── widgets/
                    .── cluster_details.dart
                    .── cluster_members.dart
                    .── cluster_page.dart
                    .── members_info.dart
                    .── cluster_page.dart
            .── splash.dart
        .── styles/
            .── colors.dart
            .── text_styles.dart
        .── widgets/
            .── customDivider.dart
└── README.md


### Packages used:

url_launcher
flutter_svg

### Fonts used:

DMSans