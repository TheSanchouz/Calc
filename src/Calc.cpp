#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>
#include "calcengine.h"

int main(int argc, char *argv[]) {
//    QJSEngine eng;
//    qDebug() << eng.evaluate("0.3 / 3").toNumber();
//    qDebug() << eng.evaluate("(0.3) / 3").toNumber();
//    qDebug() << eng.evaluate("0.1 + 0.2").toNumber();
//    qDebug() << eng.evaluate("0,1 + 0,2").toNumber();

    QGuiApplication *app = SailfishApp::application(argc, argv);
    QQuickView *view = SailfishApp::createView();
    view->setSource(SailfishApp::pathToMainQml());
    qmlRegisterType<CalcEngine>("custom.CalcEngine", 1, 0, "CalcEngine");

    return SailfishApp::main(argc, argv);
}
