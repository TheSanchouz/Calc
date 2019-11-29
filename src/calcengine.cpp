#include "calcengine.h"
#include <QDebug>
#include <QtGlobal>
#include <QRegExp>

CalcEngine::CalcEngine() : QObject() {
    expr = QString();
    value = QString();
}

QString CalcEngine::getExpr() {
    return expr;
}

void CalcEngine::setExpr(QString expr) {
    this->expr = expr;

    emit exprChanged();
}

QString CalcEngine::getValue() {
    return value;
}

void CalcEngine::preEvaluate() {
    if (expr == "") {
        value = "";
        emit valueChanged();

        return;
    }
    if (!(expr.contains("+") || expr.contains("−") || expr.contains("×") || expr.contains("÷"))) {
        qDebug()
                << "Not operations";
        return;
    }

    QString tmp = expr;
    tmp.replace(",", ".");
    tmp.replace("+", "+");
    tmp.replace("−", "-");
    tmp.replace("×", "*");
    tmp.replace("÷", "/");

    QJSValue result = engine.evaluate(tmp);

    if (result.isError()) {
        qDebug()
                << "Uncaught exception:" << result.toString() << " "
                << result.property("message").toString();

        return;
    }

    if (result.isNull() || result.isUndefined() || !qIsFinite(result.toNumber())) {
        qDebug()
                << "Catch divide by zero or smth else:" << result.toString() << " "
                << result.property("message").toString();

        return;
    }

    if (result.isNumber()) {
        qDebug() << "Num = " << result.toNumber();
        double num = result.toNumber();
        value = QString::number(num);
        value.replace(".", ",");
        emit valueChanged();
        return;
    }
}

void CalcEngine::evaluate() {
    if (expr == "") {
        value = "";
        emit valueChanged();
        return;
    }
    if (!(expr.contains("+") || expr.contains("−") || expr.contains("×") || expr.contains("÷"))) {
        qDebug()
                << "Not operations";
        return;
    }

    QString tmp = expr;
    tmp.replace(",", ".");
    tmp.replace("+", "+");
    tmp.replace("−", "-");
    tmp.replace("×", "*");
    tmp.replace("÷", "/");

    QJSValue result = engine.evaluate(tmp);

    if (result.isError()) {
        qDebug()
                << "Uncaught exception:" << result.toString() << " "
                << result.property("message").toString();

        value = "Wrong expr";
        emit valueChanged();
        return;
    }

    if (result.isNull() || result.isUndefined() || !qIsFinite(result.toNumber())) {
        qDebug()
                << "Catch divide by zero or smth else:" << result.toString() << " "
                << result.property("message").toString();

        value = "Divide by zero";
        emit valueChanged();
        return;
    }

    if (result.isNumber()) {
        qDebug() << "Num = " << result.toNumber();
        double num = result.toNumber();
        expr = QString::number(num);
        expr.replace(".", ",");
        value.clear();

        emit exprChanged();
        emit valueChanged();
        return;
    }
}
