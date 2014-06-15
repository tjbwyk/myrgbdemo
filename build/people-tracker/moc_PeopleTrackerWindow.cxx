/****************************************************************************
** Meta object code from reading C++ file 'PeopleTrackerWindow.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../people-tracker/PeopleTrackerWindow.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'PeopleTrackerWindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_PeopleTrackerImageWidget[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_PeopleTrackerImageWidget[] = {
    "PeopleTrackerImageWidget\0"
};

void PeopleTrackerImageWidget::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData PeopleTrackerImageWidget::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject PeopleTrackerImageWidget::staticMetaObject = {
    { &ntk::ImageWidget::staticMetaObject, qt_meta_stringdata_PeopleTrackerImageWidget,
      qt_meta_data_PeopleTrackerImageWidget, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &PeopleTrackerImageWidget::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *PeopleTrackerImageWidget::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *PeopleTrackerImageWidget::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_PeopleTrackerImageWidget))
        return static_cast<void*>(const_cast< PeopleTrackerImageWidget*>(this));
    typedef ntk::ImageWidget QMocSuperClass;
    return QMocSuperClass::qt_metacast(_clname);
}

int PeopleTrackerImageWidget::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    typedef ntk::ImageWidget QMocSuperClass;
    _id = QMocSuperClass::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_PeopleTrackerWindow[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      21,   20,   20,   20, 0x08,
      56,   20,   20,   20, 0x08,
      88,   20,   20,   20, 0x08,
     120,   20,   20,   20, 0x08,
     162,  154,   20,   20, 0x08,
     197,  154,   20,   20, 0x08,
     235,   20,   20,   20, 0x08,
     260,   20,   20,   20, 0x08,
     294,   20,   20,   20, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_PeopleTrackerWindow[] = {
    "PeopleTrackerWindow\0\0"
    "on_setAsBackgroundButton_clicked()\0"
    "on_saveMeshPushButton_clicked()\0"
    "on_trianglePushButton_clicked()\0"
    "on_pointCloudPushButton_clicked()\0"
    "checked\0on_showPlaneCheckBox_toggled(bool)\0"
    "on_colorMappingCheckBox_toggled(bool)\0"
    "on_resetCamera_clicked()\0"
    "on_loadParametersButton_clicked()\0"
    "on_actionNext_frame_triggered()\0"
};

void PeopleTrackerWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        PeopleTrackerWindow *_t = static_cast<PeopleTrackerWindow *>(_o);
        switch (_id) {
        case 0: _t->on_setAsBackgroundButton_clicked(); break;
        case 1: _t->on_saveMeshPushButton_clicked(); break;
        case 2: _t->on_trianglePushButton_clicked(); break;
        case 3: _t->on_pointCloudPushButton_clicked(); break;
        case 4: _t->on_showPlaneCheckBox_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 5: _t->on_colorMappingCheckBox_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 6: _t->on_resetCamera_clicked(); break;
        case 7: _t->on_loadParametersButton_clicked(); break;
        case 8: _t->on_actionNext_frame_triggered(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData PeopleTrackerWindow::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject PeopleTrackerWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_PeopleTrackerWindow,
      qt_meta_data_PeopleTrackerWindow, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &PeopleTrackerWindow::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *PeopleTrackerWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *PeopleTrackerWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_PeopleTrackerWindow))
        return static_cast<void*>(const_cast< PeopleTrackerWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int PeopleTrackerWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
