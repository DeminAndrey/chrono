#pragma once

#include <QObject>
#include <QVector>
#include <QUuid>
#include <QDateTime>
#include <memory>
#include <QDebug>
#include <QTimer>

class Task : public QObject {
  Q_OBJECT

public:
  explicit Task(QObject *parent = nullptr);

  Q_INVOKABLE void startTask(int limit);

public slots:
  void stopTask();

signals:
  void passed(int passed);

private:
  QTimer *m_timer;
  int m_limit{60};
  const int m_interval{1000};
  int m_mSecPassed{0};
};

