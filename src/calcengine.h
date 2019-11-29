#ifndef CALCENGINE_H
#define CALCENGINE_H

#include <QObject>
#include <QJSEngine>
#include <QString>

class CalcEngine : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString expr READ getExpr WRITE setExpr NOTIFY exprChanged)
    Q_PROPERTY(QString value READ getValue NOTIFY valueChanged)
private:
    QJSEngine engine;
    QString expr;
    QString value;
public:
    CalcEngine();

    QString getExpr();
    void setExpr(QString expr);
    QString getValue();

    Q_INVOKABLE void preEvaluate();
    Q_INVOKABLE void evaluate();
signals:
    void exprChanged();
    void valueChanged();
};

#endif // CALCENGINE_H
