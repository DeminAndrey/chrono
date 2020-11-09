#include "Task.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQmlContext>

int main(int argc, char *argv[])
{
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;
  const QUrl url(QStringLiteral("qrc:/main.qml"));
  QQmlComponent comp(&engine, url);

  Task taskEngine;
  engine.rootContext()->setContextProperty("task", &taskEngine);

  auto obj = comp.create();

  auto stopButton = obj->findChild<QObject*>("stopButton");

  QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                   &app, [url](QObject *obj, const QUrl &objUrl) {
    if (!obj && url == objUrl)
      QCoreApplication::exit(-1);
  }, Qt::QueuedConnection);

  QObject::connect(stopButton, SIGNAL(stop()), &taskEngine, SLOT(stopTask()));


  return app.exec();
}
