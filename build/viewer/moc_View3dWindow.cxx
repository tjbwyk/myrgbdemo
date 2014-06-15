/****************************************************************************
** Meta object code from reading C++ file 'View3dWindow.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../viewer/View3dWindow.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'View3dWindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_View3DWindow[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      14,   13,   13,   13, 0x08,
      46,   13,   13,   13, 0x08,
      78,   13,   13,   13, 0x08,
     109,   13,   13,   13, 0x08,
     151,  143,   13,   13, 0x08,
     189,   13,   13,   13, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_View3DWindow[] = {
    "View3DWindow\0\0on_saveMeshPushButton_clicked()\0"
    "on_trianglePushButton_clicked()\0"
    "on_surfelsPushButton_clicked()\0"
    "on_pointCloudPushButton_clicked()\0"
    "checked\0on_colorMappingCheckBox_toggled(bool)\0"
    "on_resetCamera_clicked()\0"
};

void View3DWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        View3DWindow *_t = static_cast<View3DWindow *>(_o);
        switch (_id) {
        case 0: _t->on_saveMeshPushButton_clicked(); break;
        case 1: _t->on_trianglePushButton_clicked(); break;
        case 2: _t->on_surfelsPushButton_clicked(); break;
        case 3: _t->on_pointCloudPushButton_clicked(); break;
        case 4: _t->on_colorMappingCheckBox_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 5: _t->on_resetCamera_clicked(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData View3DWindow::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject View3DWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_View3DWindow,
      qt_meta_data_View3DWindow, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &View3DWindow::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *View3DWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *View3DWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_View3DWindow))
        return static_cast<void*>(const_cast< View3DWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int View3DWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
