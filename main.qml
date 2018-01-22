import QtQuick 2.0
import QtWayland.Compositor 1.0

WaylandCompositor {
    id: comp

    defaultOutput: shellScreen
    ShellScreen {
        id: shellScreen
        compositor: comp
    }

    GridScreen {
        id: gridScreen
        compositor: comp
    }

    Component {
        id: chromeComponent
        ShellChrome {
        }
    }

    Component {
        id: surfaceComponent
        WaylandSurface {
            id: surface
            signal activated()
            onHasContentChanged: {
                if (hasContent && !cursorSurface) {
                    gridScreen.gridSurfaces.append( { "gridSurface" : surface } );
                } else {
                    for (var i = 0; i < gridScreen.gridSurfaces.count; i++) {
                        if (gridScreen.gridSurfaces.get(i).gridSurface === surface) {
                            gridScreen.gridSurfaces.remove(i,1);
                            break;
                        }
                    }
                }
            }
        }
    }

    WlShell {
        id: defaultShell

        onWlShellSurfaceCreated: {
            var item = chromeComponent.createObject(defaultOutput.surfaceArea, { "shellSurface": shellSurface } );
            item.surface.activated.connect(item.raise);
        }
    }

    onSurfaceRequested: {
        var surface = surfaceComponent.createObject(comp, { } );
        surface.initialize(comp, client, id, version);
    }
}
