// require requirements used below
const path = require('path');
const webpack = require('webpack');
const OwlResolver = require('opal-webpack-loader/resolver'); // to resolve ruby files
const ExtraWatchWebpackPlugin = require('extra-watch-webpack-plugin'); // to watch for added ruby files

const common_config = {
    target: 'web',
    context: path.resolve(__dirname, '../app'),
    mode: "development",
    optimization: {
        removeAvailableModules: false,
        removeEmptyChunks: false,
        minimize: false // dont minimize in development, to speed up hot reloads
    },
    performance: {
        maxAssetSize: 20000000,
        maxEntrypointSize: 20000000
    },
    devtool: false,
    output: {
        // webpack-dev-server keeps the output in memory
        filename: '[name].js',
        path: path.resolve(__dirname, '../public/assets'),
        publicPath: 'http://localhost:3035/assets/'
    },
    resolve: {
        plugins: [
            // this makes it possible for webpack to find ruby files
            new OwlResolver('resolve', 'resolved')
        ]
    },
    plugins: [
        // hot reloading
        new webpack.HotModuleReplacementPlugin(),
        // watch for added files in opal dir
        new ExtraWatchWebpackPlugin({ dirs: [ path.resolve(__dirname, '../app') ] }),
        new webpack.DefinePlugin({
            OPAL_DEVTOOLS_OBJECT_REGISTRY: true
        })
    ],
    module: {
        rules: [
            {
                // loader for .scss files
                // test means "test for for file endings"
                test: /.scss$/,
                use: [ "style-loader", "css-loader",
                    {
                        loader: "sass-loader",
                        options: { includePaths: [path.resolve(__dirname, '../app/styles')] }
                    }
                ]
            },
            {
                // loader for .css files
                test: /.css$/,
                use: [ "style-loader", "css-loader" ]
            },
            {
                test: /.(png|svg|jpg|gif|woff|woff2|eot|ttf|otf)$/,
                use: [ "file-loader" ]
            },
            {
                // opal-webpack-loader will compile and include ruby files in the pack
                test: /(\.js)?\.rb$/,
                use: [
                    {
                        loader: 'opal-webpack-loader',
                        options: {
                            sourceMap: false,
                            hmr: true,
                            hmrHook: 'Opal.Isomorfeus.$force_render()'
                        }
                    }
                ]
            }
        ]
    },
    // configuration for webpack-dev-server
    devServer: {
        open: false,
        lazy: false,
        port: 3035,
        hot: true,
        inline: true,
        https: false,
        disableHostCheck: true,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
            "Access-Control-Allow-Headers": "X-Requested-With, content-type, Authorization"
        },
        watchOptions: {
            // in case of problems with hot reloading uncomment the following two lines:
            // aggregateTimeout: 250,
            // poll: 50,
            ignored: /\bnode_modules\b/
        },
        contentBase: path.resolve(__dirname, 'public'),
        useLocalIp: false
    }
};

const browser_config = {
    entry: { application: [path.resolve(__dirname, '../app/imports/application_debug.js')] }
};

const browser_debug_guide_config = {
    entry: { application_debug_guide: [path.resolve(__dirname, '../app/imports/application_debug_guide.js')] }
};

// const web_worker_config = {
//     target: 'webworker',
//     entry: { web_worker: [path.resolve(__dirname, '../app/imports/application_web_worker.js')] }
// };

const browser = Object.assign({}, common_config, browser_config);
const browser_debug_guide = Object.assign({}, common_config, browser_debug_guide_config);
// const web_worker = Object.assign({}, common_config, web_worker_config);

module.exports = [ browser, browser_debug_guide ];
