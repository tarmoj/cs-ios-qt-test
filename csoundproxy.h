#ifndef CSOUNDPROXY_H
#define CSOUNDPROXY_H

#include <QObject>


class CsoundProxy: public QObject
{
    Q_OBJECT
public:
    explicit CsoundProxy(QObject *parent = nullptr);
    ~CsoundProxy();

    Q_INVOKABLE void play();
    Q_INVOKABLE void setChannel(QString channel, double value);

    //CSOUND * getCsound();
    
private:
    void * cs;
};

#endif // CSOUNDPROXY_H
