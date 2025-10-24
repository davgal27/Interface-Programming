#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "lut.h"

int main( int argc, char * argv[] )
{
    QGuiApplication app( argc, argv );

   /*
      Make the LUT class available in QML

      explanation:

      template < > - we should add name of C++ class or type into it
      "cz.vutbr.fit" - name space in qml 
      1 major version
      0 minor version
      LUT - name of class in QML

      In QML we use this as follows:

      import cz.vutbr.fit 1.0

      LUT {
      }

    */
    
    qmlRegisterType<LUT>( "cz.vutbr.fit", 1, 0, "LUT" );

    QQmlApplicationEngine engine;
    engine.load( QUrl( QStringLiteral( "qrc:///qml/main.qml") ) );

    return app.exec();
}
