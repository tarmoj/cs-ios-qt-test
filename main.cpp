#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "csound.hpp"
#include "csoundproxy.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);


/*
    std::string orc = "sr=44100\n\
        ksmps=32\n\
        nchnls=2\n\
        0dbfs=1\n\
\n\
        instr 1\n\
        aout vco2 0.5, 440\n\
        outs aout, aout\n\
                endin";

    std::string sco = "i1 0 1";

    Csound* csound = new Csound();
    csound->SetOption("-odac");
    csound->CompileOrc(orc.c_str());
    csound->ReadScore(sco.c_str());
    csound->Start();
    csound->Perform();
    delete csound;
*/
    CsoundProxy csoundProxy;

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
