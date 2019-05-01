using Autodesk.AutoCAD.Runtime;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Autodesk.AutoCAD.ApplicationServices;
using Autodesk.AutoCAD.Runtime;
using Autodesk.AutoCAD.DatabaseServices;
using Autodesk.AutoCAD.EditorInput;
using Autodesk.AutoCAD.Geometry;
namespace AutocadPlugin
{
    public class Class1
    {




        private List<Point2d> GetPolylinePoints(Polyline pline)
        {
            if (pline == null)
                return null;
            List<Point2d> vertices = new List<Point2d>();
            for (int i = 0, last = pline.NumberOfVertices; i < last; i++)
            {
                vertices.Add(pline.GetPoint2dAt(i));
            }
            return vertices;
        }




        Point3dCollection m_pts = new Point3dCollection();
        [CommandMethod("getpoints")]
        public void getpoints()
        {
            Document doc = Application.DocumentManager.MdiActiveDocument;
            Database db = doc.Database;
            Editor ed = doc.Editor;
            try
            { 
                using (Transaction trans = db.TransactionManager.StartTransaction())
                {

                    PromptEntityOptions peo = new PromptEntityOptions("\nSelect a base line or a polyline: ")
                    {
                        AllowNone = false
                    };
                    peo.SetRejectMessage("\n>>>This is not a polyline, Select a polyline: ");
                    peo.AddAllowedClass(typeof(Polyline), true);
                    PromptEntityResult per = ed.GetEntity(peo);
                    per = ed.GetEntity(peo);
                    if (per.Status != PromptStatus.OK)
                        return;
                    var pline = trans.GetObject(per.ObjectId, OpenMode.ForRead) as Polyline;

                    var plpoints = GetPolylinePoints(pline);

                    List<double> Xs = new List<double>();
                    List<double> Ys = new List<double>();


                    foreach (Point2d item in plpoints)
                    {
                        Xs.Add(Math.Round(item.X, 3));
                        Ys.Add(Math.Round(item.Y, 3));
                    }
                    for (int i = Xs.Count - 1; i > 0; i--)
                    {
                        Xs[i] = (Xs[i] - Xs[i - 1])*-1;
                        Ys[i] = (Ys[i] - Ys[i - 1]) * -1;
                    }



                    trans.Commit();
                }
            }
            catch (Autodesk.AutoCAD.Runtime.Exception ex)
            {
                
            }
            finally
            {

            }

        }
    }
}
