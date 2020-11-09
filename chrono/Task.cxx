#include "Task.h"

Task::Task(QObject *parent) : QObject(parent) {
  m_timer = new QTimer(this);
}

void Task::startTask(int limit) {
  m_limit = limit * 60 * 1000; //millisecond
  connect(m_timer, &QTimer::timeout, [this] {
    m_mSecPassed += 1000;
    emit passed(m_mSecPassed);
    if (m_mSecPassed >= m_limit) {
      m_timer->stop();
    }
  });
  m_timer->start(m_interval);
}

void Task::stopTask() {
  m_timer->stop();
  m_mSecPassed = 0;
}
