/****************************************************************************
** Meta object code from reading C++ file 'ModelAcquisitionWindow.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../scan-topview/ModelAcquisitionWindow.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ModelAcquisitionWindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ModelAcquisitionWindow[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      24,   23,   23,   23, 0x08,
      52,   23,   23,   23, 0x08,
      83,   23,   23,   23, 0x08,
     108,   23,   23,   23, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_ModelAcquisitionWindow[] = {
    "ModelAcquisitionWindow\0\0"
    "on_saveMeshButton_clicked()\0"
    "on_resetModelsButton_clicked()\0"
    "on_resetCamera_clicked()\0"
    "on_acquireModelsButton_clicked()\0"
};

void ModelAcquisitionWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ModelAcquisitionWindow *_t = static_cast<ModelAcquisitionWindow *>(_o);
        switch (_id) {
        case 0: _t->on_saveMeshButton_clicked(); break;
        case 1: _t->on_resetModelsButton_clicked(); break;
        case 2: _t->on_resetCamera_clicked(); break;
        case 3: _t->on_acquireModelsButton_clicked(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData ModelAcquisitionWindow::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ModelAcquisitionWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_ModelAcquisitionWindow,
      qt_meta_data_ModelAcquisitionWindow, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ModelAcquisitionWindow::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ModelAcquisitionWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ModelAcquisitionWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ModelAcquisitionWindow))
        return static_cast<void*>(const_cast< ModelAcquisitionWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int ModelAcquisitionWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
