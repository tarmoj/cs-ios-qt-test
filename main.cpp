#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "csound.hpp"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    // csoundInitialize(CSOUNDINIT_NO_ATEXIT);

    // CSOUND* csound = csoundCreate(NULL);

    // qDebug() << "Csound 0dbfs: " << csoundGet0dBFS(csound);


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

    //create an instance of Csound
    Csound* csound = new Csound();

    //set CsOptions
    csound->SetOption("-odac");

    //compile orc.
    csound->CompileOrc(orc.c_str());

    //compile sco
    csound->ReadScore(sco.c_str());

    //prepare Csound for performance
    csound->Start();

    //perform entire score
    csound->Perform();

    delete csound;



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
