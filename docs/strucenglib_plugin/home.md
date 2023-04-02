# StrucEng Library Rhinoceros Plugin

The StrucEng Library Plugin unites and extends Finite Element Analysis of
[Compas FEA](https://compas.dev/compas_fea/latest/) into [Rhinoceros
3D](https://www.rhino3d.com/). It features Rhino user-interfaces and bundles
various FE models to support the structural analysis of reinforced concrete and
masonry.

We currently implement Rhinoceros 3D support for the following FEA Analysis solvers:
<style>
.grid-cols-2 {
    width: 100%;
    height: 100%;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 4rem;
}
.view_more_btn {
    width: 180px;
    height: 55px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 16px;
    letter-spacing: 0;
    color: #fff;
    font-weight: 500;
    margin-right: 10px;
    box-shadow: 0 0.5rem 1.5rem rgba(22, 28, 45, 0.1);
}
.view_more_btn i {
    margin-left: 0.7rem;
}
.view_more_btn:hover {
    transition: box-shadow 0.25s ease, transform 0.25s ease;
}
.grid-item-2 {
    width: 100%;
    height: 100%;
}
.team_img_wrapper {
    width: 500px;
    max-width: 100%;
    height: 440px;
}
.team_img_wrapper img {
    width: 100%;
    height: 100%;
    object-fit: contain;
}
.grid-cols-3 {
    width: 100%;
    height: 100%;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    column-gap: 3rem;
    row-gap: 2rem;
    padding: 1rem;
}
.grid-col-item {
    height: 100%;
}
.icon {
    width: 100%;
    line-height: 40px;
}
.icon svg {
    width: 30px;
    height: 30px;
    color: #6b85d8;
}
.featured_info {
    width: 100%;
}
.featured_info span {
    width: 100%;
    display: block;
    font-size: 21px;
    line-height: 33px;
    color: var(header-text-color);
}
.featured_info p {
    display: block;
    width: 100%;
    margin-top: 7px;
    font-weight: 400;
    color: #334157;
    line-height: 25px;
    font-size: 15.5px;
}
.components {
    background-color: white;
    color: black !important;
    margin-top: 2rem;
}
.components-title {
    text-align: center;
    margin-bottom: 2rem;
}
.components-feat {
    margin-top: 3rem;
}
.components-feat-box {
    padding: 35px 40px 25px 40px;
    border-radius: 5px;
    text-align: center;
    background: #fff;
    box-shadow: rgb(0 0 0 / 1%) 0 1px 0, rgb(0 0 0 / 3%) 0 0 8px, rgb(0 0 0 / 8%) 0 20px 30px;
}

.components-feat-box:hover {
        box-shadow: rgb(0 0 0 / 5%) 0 1px 0, rgb(0 0 0 / 10%) 0 0 8px, rgb(0 0 0 / 15%) 0 20px 30px;
}
.components-feat-box-text {
  min-height: 7rem;
  text-align: left;
  justify-content: space-between;
  flex-direction: column;
  display: flex;
}
.components-feat-img {
    border-radius: 50%;
}

.components-but {
  display: block;
  justify-content: flex-end;
  display: flex;

}
.components-but a:hover {
    color: var(--primary-color);
    font-weight: bold;
}
</style>
<div style="padding-bottom: 3rem;">
        <div class="grid-cols-2 components-feat">
            <div class="grid-col-item components-feat-box">
                <!-- <div class="icon"> -->
                <!--     <img src="/assets/draw3.svg" class="icon-img"> -->
                <!-- </div> -->
                <div class="featured_info components-feat-box-text">
                    <div>
                        <span>Support for Abaqus</span>
                        <p>
                        Install the StrucEng Library Rhinoceros Plugin with support for
                        <a href="https://www.3ds.com/products-services/simulia/products/abaqus/">Abaqus Mechanical and Civil Engineering Simulation</a>.
                        </p>
                    </div>
                    <div class="components-but components-but--view-more">
                        <p><a href='/strucenglib_plugin/install_for_abaqus/'>Install<i class="ri-arrow-right-line"></i></a></p>
                    </div>
                </div>
            </div>
            <div class="grid-col-item components-feat-box">
                <div class="featured_info components-feat-box-text">
                    <div>
                        <span>Support for Ansys</span>
                        <p>
                            Install the StrucEng Library Rhinoceros Plugin with support for 
                            <a href="https://www.ansys.com/products/structures/ansys-mechanical#:~:text=What%20is%20Ansys%20Mechanical%3F,hydrodynamic%2C%20explicit%2C%20and%20more.">Ansys Structural FEA Analysis Software</a>.
                        </p>
                    </div>
                    <div class="components-but components-but--view-more">
                        <p><a href='/strucenglib_plugin/install_for_ansys/'>Install <i class="ri-arrow-right-line"></i></a></p>
                    </div>
                </div>
              </div>
</div>
</div>

The following pages will assist the installation of the plugin in Rhinoceros 3D. Start with the [Prerequisite Steps](./prerequisites.md)
to ensure you have all necessary software components installed.
