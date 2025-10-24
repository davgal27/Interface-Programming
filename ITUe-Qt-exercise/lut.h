#ifndef LUT_H
#define LUT_H

#include <QObject>

class LUT : public QObject
{
    Q_OBJECT
public:
    explicit LUT(QObject *parent = 0);

    // This function returns value from Look up table given by its index
    // The Q_INVOKABLE macro allows call from QML
    Q_INVOKABLE double getValue(int index);

signals:

public slots:

};

#endif // LUT_H
