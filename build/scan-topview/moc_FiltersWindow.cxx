/****************************************************************************
** Meta object code from reading C++ file 'FiltersWindow.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../scan-topview/FiltersWindow.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FiltersWindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_FiltersWindow[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      13,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      23,   15,   14,   14, 0x08,
      65,   15,   14,   14, 0x08,
     111,  105,   14,   14, 0x08,
     147,  105,   14,   14, 0x08,
     183,  105,   14,   14, 0x08,
     223,  105,   14,   14, 0x08,
     263,   15,   14,   14, 0x08,
     297,   15,   14,   14, 0x08,
     330,   15,   14,   14, 0x08,
     362,   15,   14,   14, 0x08,
     397,   15,   14,   14, 0x08,
     428,   15,   14,   14, 0x08,
     468,  105,   14,   14, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_FiltersWindow[] = {
    "FiltersWindow\0\0checked\0"
    "on_removeSmallStructuresBox_toggled(bool)\0"
    "on_fillSmallHolesCheckBox_toggled(bool)\0"
    "value\0on_maxDepthSlider_valueChanged(int)\0"
    "on_minDepthSlider_valueChanged(int)\0"
    "on_maxAmplitudeSlider_valueChanged(int)\0"
    "on_minAmplitudeSlider_valueChanged(int)\0"
    "on_unstableCheckBox_toggled(bool)\0"
    "on_normalsCheckBox_toggled(bool)\0"
    "on_medianCheckBox_toggled(bool)\0"
    "on_amplitudeCheckBox_toggled(bool)\0"
    "on_edgesCheckBox_toggled(bool)\0"
    "on_depthThresholdCheckBox_toggled(bool)\0"
    "on_kinectTiltSlider_valueChanged(int)\0"
};

void FiltersWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        FiltersWindow *_t = static_cast<FiltersWindow *>(_o);
        switch (_id) {
        case 0: _t->on_removeSmallStructuresBox_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 1: _t->on_fillSmallHolesCheckBox_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 2: _t->on_maxDepthSlider_valueChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: _t->on_minDepthSlider_valueChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 4: _t->on_maxAmplitudeSlider_valueChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 5: _t->on_minAmplitudeSlider_valueChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 6: _t->on_unstableCheckBox_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 7: _t->on_normalsCheckBox_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 8: _t->on_medianCheckBox_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 9: _t->on_amplitudeCheckBox_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 10: _t->on_edgesCheckBox_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 11: _t->on_depthThresholdCheckBox_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 12: _t->on_kinectTiltSlider_valueChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData FiltersWindow::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject FiltersWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_FiltersWindow,
      qt_meta_data_FiltersWindow, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &FiltersWindow::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *FiltersWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *FiltersWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_FiltersWindow))
        return static_cast<void*>(const_cast< FiltersWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int FiltersWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 13)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 13;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
